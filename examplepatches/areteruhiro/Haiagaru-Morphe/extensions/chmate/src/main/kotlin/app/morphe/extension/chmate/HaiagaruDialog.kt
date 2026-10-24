package app.morphe.extension.chmate

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.widget.*
import androidx.compose.foundation.combinedClickable
import android.content.DialogInterface
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.view.WindowManager
import android.widget.Button
import androidx.activity.ComponentDialog
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.unit.dp

/** Compose content with DialogInterface semantics for the existing validation callbacks. */
class HaiagaruDialog private constructor(private val spec: Builder) :
    ComponentDialog(HaiagaruComposeActivity.dialogContext(spec.activity)) {
    private var message by mutableStateOf(spec.message)
    private var heading by mutableStateOf(spec.title)
    private var chosen by mutableIntStateOf(spec.singleChoice)
    private var revision by mutableIntStateOf(0)
    private val checkedItems = spec.checked?.toList()?.toMutableStateList()
    private val actions = linkedMapOf<Int, Button>()
    private var composeContent: ComposeView? = null
    private var dismissed = true
    private val mainHandler = android.os.Handler(android.os.Looper.getMainLooper())
    private var generation = 0
    private var actionPending = false
    private fun traceWindow(event: String) {
        if (System.getProperty("haiagaru.dialog.trace") != "true") return
        android.util.Log.d("HaiagaruDialog", "$event id=${System.identityHashCode(this)} showing=$isShowing attached=${window?.decorView?.isAttachedToWindow}")
        if (event == "show-enter") android.util.Log.d("HaiagaruDialog", "show caller", Throwable())
    }
    private val nativeList = object : ListView(context) {
        override fun post(action: Runnable): Boolean = android.os.Handler(android.os.Looper.getMainLooper()).post(action)
        override fun setItemChecked(position: Int, value: Boolean) {
            super.setItemChecked(position, value)
            spec.checked?.let { if (position in it.indices) it[position] = value }
            if (spec.singleChoiceMode && value) chosen = position
            refresh()
        }
    }.apply {
        adapter = spec.adapter ?: ArrayAdapter(context, android.R.layout.simple_list_item_1,
            spec.items?.toMutableList() ?: mutableListOf<CharSequence>())
    }


    init {
        requestWindowFeature(Window.FEATURE_NO_TITLE)
        setCancelable(spec.cancelable)
        setOnCancelListener(spec.cancel)
        setOnDismissListener(spec.dismiss)
        spec.buttons.forEach { (which, action) -> setButton(which, action.first, action.second) }
        val content = ComposeView(context).apply {
            setContent { HaiagaruUi.Theme { DialogContent() } }
        }
        composeContent = content
        content.addOnAttachStateChangeListener(object : View.OnAttachStateChangeListener {
            override fun onViewAttachedToWindow(view: View) {
                if (dismissed) view.post { if (dismissed) removeDismissedWindow() }
            }
            override fun onViewDetachedFromWindow(view: View) = Unit
        })
        setContentView(content)
    }

    fun setMessage(value: CharSequence?) { message = value?.toString().orEmpty() }
    fun setModelView(value: View) {
        if (value is ViewGroup) prepareNativeSurfaces(value)
        spec.view = value
        refresh()
    }
    override fun setTitle(value: CharSequence?) { heading = value?.toString().orEmpty() }
    fun getButton(which: Int): Button = requireNotNull(actions[which])
    fun getListView(): ListView = nativeList
    override fun dismiss() {
        // All callers, including custom button/choice listeners, must leave Compose's
        // input coroutine before detaching it. Ignore stale requests after a re-show.
        val requestedGeneration = generation
        mainHandler.post {
            if (generation == requestedGeneration) dismissNow()
        }
    }

    private fun dismissNow() {
        if (dismissed) return
        dismissed = true
        traceWindow("dismiss-enter")
        try {
            super.dismiss()
        } catch (detached: IllegalArgumentException) {
            // Activity/window cleanup can remove this decor before our queued
            // dismissal runs. Do not turn an already detached dialog into a crash.
            if (window?.decorView?.isAttachedToWindow == true) throw detached
        }
        composeContent?.disposeComposition()
        removeDismissedWindow()
        traceWindow("dismiss-exit")
    }

    private fun removeDismissedWindow() {
        if (!dismissed || isShowing) return
        val decor = window?.decorView ?: return
        // Clear modality even when detach completed synchronously. A queued layout/
        // attach from the previous Activity must not restore an invisible input trap.
        window?.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND)
        window?.addFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)
        decor.visibility = View.GONE
        // A dismissed zero-height Compose window can remain attached across a native
        // viewer transition. It still dims and consumes input despite isShowing=false.
        // Remove only this dialog's own decor, never an Activity or another dialog.
        if (decor.isAttachedToWindow) {
            try { window?.windowManager?.removeViewImmediate(decor) }
            catch (_: IllegalArgumentException) { /* Already removed by the platform. */ }
        }
    }
    /** Remove this window before native callbacks attach another modal window/activity. */
    fun dismissForNavigation(action: Runnable) {
        // Do not detach Compose while its long-press coroutine is dispatching.
        // Detach can cancel that coroutine inside Dialog.dismiss(), skipping cleanup
        // and the queued native navigation. Run BOTH operations after input dispatch.
        if (actionPending || dismissed) return
        actionPending = true
        val requestedGeneration = generation
        mainHandler.post {
            if (generation != requestedGeneration) return@post
            dismissNow()
            if (!spec.activity.isFinishing && !spec.activity.isDestroyed) action.run()
        }
    }

    private fun dispatchClosingAction(action: () -> Unit) {
        if (actionPending || dismissed) return
        actionPending = true
        val requestedGeneration = generation
        mainHandler.post {
            if (generation != requestedGeneration) return@post
            try {
                if (!spec.activity.isFinishing && !spec.activity.isDestroyed) action()
            } finally {
                // Preserve DialogInterface's callback-before-dismiss ordering, but
                // execute both outside the Compose input dispatch.
                if (generation == requestedGeneration) dismissNow()
            }
        }
    }
    fun setButton(which: Int, text: CharSequence, callback: DialogInterface.OnClickListener?) {
        actions[which] = Button(context).apply {
            this.text = text
            setOnClickListener { dispatchClosingAction { callback?.onClick(this@HaiagaruDialog, which) } }
        }
        refresh()
    }
    fun refresh() {
        spec.checked?.forEachIndexed { index, value -> checkedItems?.set(index, value) }
        revision++
    }

    override fun show() {
        generation++
        actionPending = false
        dismissed = false
        traceWindow("show-enter")
        window?.apply {
            clearFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)
            addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND)
            decorView.visibility = View.VISIBLE
        }
        super.show()
        traceWindow("show-super-return")
        window?.apply {
            setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
            setLayout((context.resources.displayMetrics.widthPixels * .92f).toInt(), WindowManager.LayoutParams.WRAP_CONTENT)
        }
        traceWindow("show-exit")
    }

    @OptIn(ExperimentalLayoutApi::class, androidx.compose.foundation.ExperimentalFoundationApi::class)
    @Composable private fun DialogContent() {
        @Suppress("UNUSED_VARIABLE") val refresh = revision
        val version = rememberModelRevision(spec.view, spec.customTitle, nativeList, *actions.values.toTypedArray())
        val adapterModel = nativeList.adapter
        DisposableEffect(adapterModel) {
            val observer = object : android.database.DataSetObserver() {
                override fun onChanged() { refresh() }
                override fun onInvalidated() { refresh() }
            }
            adapterModel.registerDataSetObserver(observer)
            onDispose { adapterModel.unregisterDataSetObserver(observer) }
        }
        @Suppress("UNUSED_VARIABLE") val modelVersion = version
        Surface(shape = MaterialTheme.shapes.extraLarge, color = MaterialTheme.colorScheme.surfaceContainerHigh,
            border = androidx.compose.foundation.BorderStroke(1.dp, MaterialTheme.colorScheme.outline)) {
            Column(Modifier.fillMaxWidth().padding(24.dp), verticalArrangement = Arrangement.spacedBy(16.dp)) {
                spec.icon?.let { drawable ->
                    val model = remember(drawable) { ImageView(context).apply { setImageDrawable(drawable) } }
                    ModelContent(model, version)
                }
                if (heading.isNotBlank()) Text(heading, style = MaterialTheme.typography.headlineSmall)
                spec.customTitle?.let { ModelContent(it, version) { refresh() } }
                val browser = spec.view?.takeIf { weightedSurface(it) != null } as? android.widget.LinearLayout
                if (browser != null) {
                    BrowserModel(browser, version, Modifier.fillMaxWidth()
                        .height((context.resources.configuration.screenHeightDp * .55f).dp)) { refresh() }
                } else Column(Modifier.fillMaxWidth().heightIn(max = (context.resources.configuration.screenHeightDp * .60f).dp)
                    .verticalScroll(rememberScrollState()), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    if (spec.progress) Row(verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                        CircularProgressIndicator(Modifier.size(32.dp))
                        Text(message, style = MaterialTheme.typography.bodyLarge)
                    } else if (message.isNotBlank()) Text(message, style = MaterialTheme.typography.bodyMedium)
                    if (spec.items != null || spec.adapter != null) {
                        val adapter = nativeList.adapter
                        androidx.compose.foundation.lazy.LazyColumn(Modifier.fillMaxWidth().heightIn(max = 440.dp)) {
                        items(adapter.count) { index ->
                            val label = adapter.getItem(index)?.toString().orEmpty()
                            val checked = checkedItems
                            if (checked != null && index >= checked.size) {
                                ModelContent(adapter.getView(index, null, nativeList), version) { refresh() }
                                return@items
                            }
                            val row = adapter.getView(index, null, nativeList)
                            Row(Modifier.fillMaxWidth().combinedClickable(enabled = nativeList.isEnabled && adapter.isEnabled(index),
                                onLongClick = { nativeList.onItemLongClickListener?.onItemLongClick(nativeList,
                                    row, index, adapter.getItemId(index)) },
                                onClick = {
                                    if (checked != null) {
                                        val value = !checked[index]
                                        nativeList.setItemChecked(index, value)
                                        spec.multi?.onClick(this@HaiagaruDialog, index, value)
                                    } else if (spec.singleChoiceMode) {
                                        chosen = index
                                        spec.itemClick?.onClick(this@HaiagaruDialog, index)
                                    } else {
                                        dispatchClosingAction { spec.itemClick?.onClick(this@HaiagaruDialog, index) }
                                    }
                                    refresh()
                                }).padding(vertical = 8.dp), verticalAlignment = Alignment.CenterVertically) {
                                if (checked != null) Checkbox(checked[index], onCheckedChange = null)
                                else if (spec.singleChoiceMode) RadioButton(chosen == index, onClick = null)
                                if (spec.adapter != null) Box(Modifier.weight(1f)) { ModelContent(row, version) { refresh() } }
                                else Text(label, Modifier.weight(1f), style = MaterialTheme.typography.bodyLarge)
                            }
                        }
                        }
                    }
                    spec.view?.let { ModelContent(it, version, insideScroll = true) { refresh() } }

                }
                FlowRow(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.End) {
                    listOf(DialogInterface.BUTTON_NEUTRAL, DialogInterface.BUTTON_NEGATIVE, DialogInterface.BUTTON_POSITIVE).forEach { which ->
                        actions[which]?.takeIf { it.visibility == View.VISIBLE }?.let { button ->
                            TextButton(onClick = { button.performClick() }, enabled = button.isEnabled) { Text(button.text.toString()) }
                        }
                    }
                }
            }
        }
    }

    class Builder(context: Context) {
        internal val activity = findActivity(context)
        internal var customTitle: View? = null
        internal var icon: android.graphics.drawable.Drawable? = null
        internal var adapter: ListAdapter? = null
        internal var singleChoice = -1
        internal var singleChoiceMode = false
        internal var title = ""
        internal var message = ""
        internal var view: View? = null
        internal var items: Array<out CharSequence>? = null
        internal var checked: BooleanArray? = null
        internal var multi: DialogInterface.OnMultiChoiceClickListener? = null
        internal var itemClick: DialogInterface.OnClickListener? = null
        internal var cancel: DialogInterface.OnCancelListener? = null
        internal var dismiss: DialogInterface.OnDismissListener? = null
        internal var cancelable = true
        internal var progress = false
        internal val buttons = linkedMapOf<Int, Pair<CharSequence, DialogInterface.OnClickListener?>>()
        fun setCustomTitle(value: View) = apply { customTitle = value }
        fun setIcon(value: android.graphics.drawable.Drawable?) = apply { icon = value }
        fun setIcon(value: Int) = apply { icon = if (value == 0) null else activity.getDrawable(value) }
        fun setTitle(value: Int) = setTitle(activity.getText(value))
        fun setMessage(value: Int) = setMessage(activity.getText(value))
        fun setAdapter(value: ListAdapter, callback: DialogInterface.OnClickListener?) = apply { adapter = value; itemClick = callback }
        fun setSingleChoiceItems(labels: Array<out CharSequence>, selection: Int, callback: DialogInterface.OnClickListener?) = apply {
            items = labels; singleChoice = selection; singleChoiceMode = true; itemClick = callback
        }
        fun setTitle(value: CharSequence) = apply { title = value.toString() }
        fun setMessage(value: CharSequence) = apply { message = value.toString() }
        fun setView(value: View) = apply {
            if (value is ViewGroup) prepareNativeSurfaces(value)
            view = if (value is ViewGroup) value else android.widget.LinearLayout(activity).apply { addView(value) }
        }
        fun setCancelable(value: Boolean) = apply { cancelable = value }
        fun setOnCancelListener(value: DialogInterface.OnCancelListener?) = apply { cancel = value }
        fun setOnDismissListener(value: DialogInterface.OnDismissListener?) = apply { dismiss = value }
        fun setPositiveButton(text: CharSequence, callback: DialogInterface.OnClickListener?) = apply { buttons[DialogInterface.BUTTON_POSITIVE] = text to callback }
        fun setNegativeButton(text: CharSequence, callback: DialogInterface.OnClickListener?) = apply { buttons[DialogInterface.BUTTON_NEGATIVE] = text to callback }
        fun setNeutralButton(text: CharSequence, callback: DialogInterface.OnClickListener?) = apply { buttons[DialogInterface.BUTTON_NEUTRAL] = text to callback }
        fun setPositiveButton(text: Int, callback: DialogInterface.OnClickListener?) = setPositiveButton(activity.getText(text), callback)
        fun setNegativeButton(text: Int, callback: DialogInterface.OnClickListener?) = setNegativeButton(activity.getText(text), callback)
        fun setItems(labels: Array<out CharSequence>, callback: DialogInterface.OnClickListener?) = apply { items = labels; itemClick = callback }
        fun setMultiChoiceItems(labels: Array<out CharSequence>, selected: BooleanArray, callback: DialogInterface.OnMultiChoiceClickListener?) = apply {
            items = labels; checked = selected; multi = callback
        }
        fun create() = HaiagaruDialog(this)
        fun show() = create().also { it.show() }
    }

    companion object {
        private fun findActivity(value: Context): Activity {
            var current = value
            while (current is ContextWrapper && current !is Activity) current = current.baseContext
            return current as? Activity ?: error("Haiagaru dialogs require an Activity")
        }
        @JvmStatic fun progress(activity: Activity, message: String): HaiagaruDialog =
            Builder(activity).setMessage(message).setCancelable(false).apply { progress = true }.create()
    }
}
