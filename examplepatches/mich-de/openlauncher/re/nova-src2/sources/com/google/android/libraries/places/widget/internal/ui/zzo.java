package com.google.android.libraries.places.widget.internal.ui;

import android.content.res.Resources;
import android.view.View;
import android.view.ViewPropertyAnimator;
import androidx.recyclerview.widget.p;
import androidx.recyclerview.widget.s2;
import com.google.android.libraries.places.R;
import com.google.android.libraries.places.internal.zzkd;
import f6.a;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzo extends p {
    private final List zza = new ArrayList();
    private final List zzb = new ArrayList();
    private final List zzc = new ArrayList();
    private final int zzd;

    public zzo(Resources resources) {
        this.zzd = resources.getDimensionPixelSize(R.dimen.places_autocomplete_vertical_dropdown);
    }

    private final void zzd(s2 s2Var) {
        List list = this.zzc;
        View view = s2Var.itemView;
        list.add(s2Var);
        long moveDuration = getMoveDuration() + (s2Var.getLayoutPosition() * 67);
        view.setTranslationY(-this.zzd);
        view.setAlpha(0.0f);
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        viewPropertyAnimatorAnimate.cancel();
        viewPropertyAnimatorAnimate.translationY(0.0f).alpha(1.0f).setDuration(133L).setInterpolator(new a(1)).setStartDelay(moveDuration);
        viewPropertyAnimatorAnimate.setListener(new zzn(this, view, s2Var, viewPropertyAnimatorAnimate)).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zze() {
        if (isRunning()) {
            return;
        }
        dispatchAnimationsFinished();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zzf(View view) {
        view.setAlpha(1.0f);
        view.setTranslationY(0.0f);
    }

    @Override // androidx.recyclerview.widget.p, androidx.recyclerview.widget.v2
    public final boolean animateAdd(s2 s2Var) throws Throwable {
        try {
            endAnimation(s2Var);
            s2Var.itemView.setAlpha(0.0f);
            if (((zzt) s2Var).zzb()) {
                this.zza.add(s2Var);
                return true;
            }
            this.zzb.add(s2Var);
            return true;
        } catch (Error e3) {
            e = e3;
            zzkd.zzb(e);
            throw e;
        } catch (RuntimeException e11) {
            e = e11;
            zzkd.zzb(e);
            throw e;
        }
    }

    @Override // androidx.recyclerview.widget.p, androidx.recyclerview.widget.u1
    public final void endAnimation(s2 s2Var) throws Throwable {
        try {
            super.endAnimation(s2Var);
            if (this.zza.remove(s2Var)) {
                zzf(s2Var.itemView);
                dispatchAddFinished(s2Var);
            }
            zze();
        } catch (Error e3) {
            e = e3;
            zzkd.zzb(e);
            throw e;
        } catch (RuntimeException e11) {
            e = e11;
            zzkd.zzb(e);
            throw e;
        }
    }

    @Override // androidx.recyclerview.widget.p, androidx.recyclerview.widget.u1
    public final void endAnimations() throws Throwable {
        try {
            int size = this.zza.size();
            while (true) {
                size--;
                if (size < 0) {
                    break;
                }
                s2 s2Var = (s2) this.zza.get(size);
                zzf(s2Var.itemView);
                dispatchAddFinished(s2Var);
                this.zza.remove(size);
            }
            List list = this.zzc;
            int size2 = list.size();
            while (true) {
                size2--;
                if (size2 < 0) {
                    super.endAnimations();
                    return;
                }
                ((s2) list.get(size2)).itemView.animate().cancel();
            }
        } catch (Error e3) {
            e = e3;
            zzkd.zzb(e);
            throw e;
        } catch (RuntimeException e11) {
            e = e11;
            zzkd.zzb(e);
            throw e;
        }
    }

    @Override // androidx.recyclerview.widget.p, androidx.recyclerview.widget.u1
    public final boolean isRunning() {
        try {
            if (!super.isRunning() && this.zzb.isEmpty() && this.zza.isEmpty()) {
                return !this.zzc.isEmpty();
            }
            return true;
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    @Override // androidx.recyclerview.widget.p, androidx.recyclerview.widget.u1
    public final void runPendingAnimations() throws Throwable {
        try {
            Iterator it = this.zzb.iterator();
            while (it.hasNext()) {
                super.animateAdd((s2) it.next());
            }
            this.zzb.clear();
            super.runPendingAnimations();
            if (this.zza.isEmpty()) {
                return;
            }
            ArrayList arrayList = new ArrayList(this.zza);
            this.zza.clear();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                s2 s2Var = (s2) it2.next();
                View view = s2Var.itemView;
                this.zzc.add(s2Var);
                long moveDuration = getMoveDuration() + (s2Var.getLayoutPosition() * 67);
                view.setTranslationY(-this.zzd);
                view.setAlpha(0.0f);
                ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
                viewPropertyAnimatorAnimate.cancel();
                viewPropertyAnimatorAnimate.translationY(0.0f).alpha(1.0f).setDuration(133L).setInterpolator(new a(1)).setStartDelay(moveDuration);
                viewPropertyAnimatorAnimate.setListener(new zzn(this, view, s2Var, viewPropertyAnimatorAnimate)).start();
            }
        } catch (Error e3) {
            e = e3;
            zzkd.zzb(e);
            throw e;
        } catch (RuntimeException e11) {
            e = e11;
            zzkd.zzb(e);
            throw e;
        }
    }
}
