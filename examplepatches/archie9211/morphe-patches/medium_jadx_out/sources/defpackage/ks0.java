package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ks0 extends b8 implements m45 {
    public final /* synthetic */ int h = 2;
    public final /* synthetic */ sb2 i;
    public final /* synthetic */ v7c j;
    public final /* synthetic */ Object k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ks0(sb2 sb2Var, v7c v7cVar, js0 js0Var) {
        super("BlockReposterConfirmationModalBottomSheet$dismissSheet(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/SheetState;Lcom/medium/android/repost/common/ui/blockreposterconfirmation/BlockReposterConfirmationListener;Lkotlin/jvm/functions/Function0;)V");
        this.i = sb2Var;
        this.j = v7cVar;
        this.k = js0Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.h;
        int i2 = 12;
        c1e c1eVar = c1e.a;
        Object obj = this.k;
        sb2 sb2Var = this.i;
        switch (i) {
            case 0:
                vx0.c0(sb2Var, null, null, new l0(new n7(i2), this.j, (js0) obj, null, 18), 3);
                break;
            case 1:
                vx0.c0(sb2Var, null, null, new ku2(new n7(29), this.j, (t53) obj, null, 6), 3);
                break;
            case 2:
                vx0.c0(sb2Var, null, null, new mw9(new lg9(i2), this.j, (h4b) obj, (n92) null, 14), 3);
                break;
            default:
                lg9 lg9Var = new lg9(13);
                mk7.j(sb2Var, this.j, (l8b) obj, lg9Var);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ks0(sb2 sb2Var, v7c v7cVar, t53 t53Var) {
        super("DeleteRepostConfirmationModalBottomSheet$dismissSheet(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/SheetState;Lcom/medium/android/repost/common/ui/deleterepostconfirmation/DeleteRepostConfirmationListener;Lkotlin/jvm/functions/Function0;)V");
        this.i = sb2Var;
        this.j = v7cVar;
        this.k = t53Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ks0(sb2 sb2Var, v7c v7cVar, h4b h4bVar) {
        super("RemoveNoteConfirmationModalBottomSheet$dismissSheet(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/SheetState;Lcom/medium/android/repost/common/ui/removenoteconfirmation/RemoveNoteConfirmationListener;Lkotlin/jvm/functions/Function0;)V");
        this.i = sb2Var;
        this.j = v7cVar;
        this.k = h4bVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ks0(sb2 sb2Var, v7c v7cVar, l8b l8bVar) {
        super("RepostMenuModalBottomSheet$dismissSheet(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/SheetState;Lcom/medium/android/repost/common/ui/repostmenu/RepostMenuListener;Lkotlin/jvm/functions/Function0;)V");
        this.i = sb2Var;
        this.j = v7cVar;
        this.k = l8bVar;
    }
}
