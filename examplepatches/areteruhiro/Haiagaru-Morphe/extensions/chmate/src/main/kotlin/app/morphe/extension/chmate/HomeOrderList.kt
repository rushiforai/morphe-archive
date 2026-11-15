package app.morphe.extension.chmate

import android.widget.ListView
import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.scrollBy
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.semantics.*
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch

/** Dialog-local draft order. The existing Save/Cancel buttons own persistence. */
@Composable internal fun HomeOrderList(view: ListView, ordering: HomeThreadOrder.DragOrder, revision: Int, changed: () -> Unit) {
    val state=rememberLazyListState()
    val scope=rememberCoroutineScope()
    var dragging by remember(view) { mutableIntStateOf(-1) }
    var pointerY by remember(view) { mutableFloatStateOf(0f) }
    val currentChanged by rememberUpdatedState(changed)
    var localRevision by remember(view) { mutableIntStateOf(0) }
    val rows=remember(view,revision,localRevision) {
        val adapter=view.adapter
        (0 until (adapter?.count ?: 0)).map { index ->
            HomeOrderRow(adapter?.getItem(index)?.toString().orEmpty().removePrefix("📌 "),ordering.pinned(index))
        }
    }
    val invalidate={localRevision++;currentChanged()}

    LazyColumn(Modifier.fillMaxWidth().height(420.dp),state=state,
        verticalArrangement=Arrangement.spacedBy(4.dp)) {
        items(rows.size) { index ->
            val entry=rows[index]
            Row(Modifier.fillMaxWidth()
                .background(if(dragging==index) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.surfaceContainerLow)
                .semantics {
                    customActions=listOf(
                        CustomAccessibilityAction("一つ上へ") { ordering.move(index,index-1).also { if(it)invalidate() } },
                        CustomAccessibilityAction("一つ下へ") { ordering.move(index,index+1).also { if(it)invalidate() } })
                }.padding(start=12.dp),verticalAlignment=Alignment.CenterVertically) {
                Text(entry.label,Modifier.weight(1f).padding(vertical=12.dp),fontSize=14.sp)
                TextButton(onClick={ordering.togglePin(index);invalidate()},
                    modifier=Modifier.semantics { contentDescription=if(entry.pinned)"ピン留めを解除" else "ピン留め" }) {
                    Text(if(entry.pinned)"📌" else "☆")
                }
                Text("☰",fontSize=24.sp,modifier=Modifier
                    .width(48.dp).heightIn(min=48.dp)
                    .semantics { contentDescription="上下にドラッグして並び替え" }
                    .pointerInput(view) {
                        detectDragGestures(
                            onDragStart={ _ ->
                                val item=state.layoutInfo.visibleItemsInfo.firstOrNull { it.index==index }
                                if(item!=null){dragging=index;pointerY=item.offset+item.size/2f}
                            },
                            onDragEnd={dragging=-1},onDragCancel={dragging=-1},
                            onDrag={change,amount ->
                                change.consume()
                                if(dragging>=0){
                                    pointerY+=amount.y
                                    val info=state.layoutInfo
                                    val target=info.visibleItemsInfo.firstOrNull { pointerY>=it.offset&&pointerY<it.offset+it.size }?.index
                                    if(target!=null&&target!=dragging&&ordering.move(dragging,target)){
                                        dragging=target;invalidate()
                                    }
                                    val edge=48.dp.toPx()
                                    val step=when { pointerY<info.viewportStartOffset+edge -> -20f
                                        pointerY>info.viewportEndOffset-edge -> 20f
                                        else -> 0f }
                                    if(step!=0f)scope.launch { state.scrollBy(step) }
                                }
                            })
                    }.padding(top=8.dp))
            }
        }
    }
}

private data class HomeOrderRow(val label: String,val pinned: Boolean)
