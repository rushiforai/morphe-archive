package patches.west

import com.android.tools.smali.dexlib2.Opcode

// Exact original West contracts; keep native bodies, callbacks and retained state.
internal val trackingTargets = listOf(
    OwnedMethod("Lp08;", "h(Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;Ldq5;)V", 0x11, 8, 65, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "j(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V", 0x11, 9, 55, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "k(Ljava/lang/String;JLjava/lang/Double;)V", 0x11, 11, 627, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "l()V", 0x11, 5, 34, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "m(Z)V", 0x11, 6, 48, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "n(Ljava/util/ArrayList;)V", 0x11, 6, 47, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lp08;", "o(Ljava/util/List;)V", 0x11, 6, 48, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lxy5;", "b([Lsd2;)V", 0x91, 5, 8, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lcc5;", "a()Ljava/lang/String;", 0x11, 12, 57, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const-string v0, \"\"", "return-object v0")),
    )),
    OwnedMethod("Lcc5;", "b(Ljava/lang/String;Lg25;)Ljava/lang/Object;", 0x11, 7, 26, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "throw v0")),
    )),
    OwnedMethod("Lnb1;", "f(Z)V", 0x11, 14, 228, listOf(
        OwnedEdit(43, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v0, 0x0")),
        OwnedEdit(46, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v1, 0x0")),
    )),
    OwnedMethod("Lsz6;", "run()V", 0x11, 19, 220, listOf(
        OwnedEdit(36, listOf(Opcode.IGET_OBJECT), listOf("Lsz6;->c:Ltj;"), listOf("return-void")),
    )),
    OwnedMethod("Lhd1;", "uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V", 0x11, 4, 8, listOf(
        OwnedEdit(2, listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL), listOf("Lhd1;->b:Ljh;", "Ljh;->j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"), listOf("nop", "nop")),
    )),
    OwnedMethod("Lim9;", "run()V", 0x11, 25, 416, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-static/range {p0 .. p0}, Lim9;->morpheFailMeasurement(Lim9;)V", "return-void")),
    )),
    OwnedMethod("Lv70;", "l(Ljava/lang/String;Ljava/util/Map;)V", 0x11, 23, 368, listOf(
        OwnedEdit(269, listOf(), listOf(), listOf("invoke-static {v5}, Lv70;->morpheNoStats(Ljava/util/Map;)V")),
    )),
    OwnedMethod("Lre0;", "n(Ljava/util/Map;)V", 0x11, 14, 133, listOf(
        OwnedEdit(79, listOf(Opcode.NEW_INSTANCE), listOf("Ljava/lang/StringBuilder;"), listOf("const/4 v0, 0x2", "nop", "new-instance v2, Ljava/lang/StringBuilder;"), target = 100, branch = 1),
    )),
    OwnedMethod("Lix0;", "d0(Ljava/lang/String;)V", 0x1, 8, 112, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ly56;", "o()Ljava/lang/String;", 0x1, 1, 10, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return-object p0")),
    )),
    OwnedMethod("Ly56;", "i()Z", 0x1, 1, 10, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x1", "return p0")),
    )),
    OwnedMethod("Lyg3;", "o()Ljava/lang/String;", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return-object p0")),
    )),
    OwnedMethod("Lyg3;", "i()Z", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x1", "return p0")),
    )),
    OwnedMethod("Lyg3;", "a()Lea;", 0x11, 3, 23, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lda;", "a(Landroid/content/Context;)Lca;", 0x9, 14, 80, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Lca;", "const-string v1, \"\"", "const/4 v2, 0x1", "invoke-direct {v0, v1, v2}, Lca;-><init>(Ljava/lang/String;Z)V", "return-object v0")),
    )),
    OwnedMethod("Lda;", "g()Lca;", 0x11, 7, 56, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Lca;", "const-string v1, \"\"", "const/4 v2, 0x1", "invoke-direct {v0, v1, v2}, Lca;-><init>(Ljava/lang/String;Z)V", "return-object v0")),
    )),
    OwnedMethod("Laz9;", "P(Ljava/lang/String;)Landroid/util/Pair;", 0x11, 15, 84, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Landroid/util/Pair;", "const-string v1, \"\"", "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", "return-object v0")),
    )),
    OwnedMethod("Laz9;", "O(Lo5a;Lqq9;)Landroid/util/Pair;", 0x11, 5, 17, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Landroid/util/Pair;", "const-string v1, \"\"", "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", "return-object v0")),
    )),
    OwnedMethod("Laz9;", "Q(Lo5a;Lqq9;)Ljava/lang/String;", 0x11, 5, 36, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const-string v0, \"\"", "return-object v0")),
    )),
    OwnedMethod("Lw00;", "s(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 14, 508, listOf(
        OwnedEdit(333, listOf(Opcode.IGET_OBJECT), listOf("Lw00;->f:Ljava/lang/Object;"), listOf("nop"), target = 350, branch = 0),
    )),
    OwnedMethod("Lcom/google/ads/interactivemedia/v3/internal/zzeu;", "zze(Lcom/google/ads/interactivemedia/v3/api/BaseRequest;Lcom/google/ads/interactivemedia/v3/internal/zzeo;Ljava/lang/String;Lcom/google/ads/interactivemedia/v3/internal/zzer;)Lcom/google/ads/interactivemedia/v3/internal/zzpq;", 0x12, 21, 148, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-static {}, Lcom/google/ads/interactivemedia/v3/internal/zzpq;->zzf()Lcom/google/ads/interactivemedia/v3/internal/zzpq;", "move-result-object v0", "return-object v0")),
    )),
    OwnedMethod("Lhb9;", "a()Lcp9;", 0x11, 7, 97, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Luo9;->a:Luo9;", "return-object v0")),
    )),
    OwnedMethod("Lfv0;", "H(Lzv2;Lv31;)Ld50;", 0x1, 8, 26, listOf(
        OwnedEdit(12, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT), listOf("Lwe9;->t(Landroid/content/Context;)Ljava/lang/String;", null), listOf("const-string v1, \"\"", "nop")),
    )),
    OwnedMethod("Lwk4;", "run()V", 0x11, 14, 392, listOf(
        OwnedEdit(22, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT), listOf("Lwe9;->t(Landroid/content/Context;)Ljava/lang/String;", null), listOf("const-string v10, \"\"", "nop")),
    )),
    OwnedMethod("Lli1;", "Q(Landroid/content/Context;)Lew;", 0x9, 18, 241, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lcom/startapp/sdk/common/advertisingid/b;", "a(Landroid/content/Context;)Lcom/startapp/sdk/internal/n0;", 0x9, 15, 118, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Lcom/startapp/sdk/internal/n0;->d:Lcom/startapp/sdk/internal/n0;", "return-object v0")),
    )),
    OwnedMethod("Lcom/startapp/sdk/common/advertisingid/b;", "b(Landroid/content/Context;)Lcom/startapp/sdk/internal/n0;", 0x9, 11, 87, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Lcom/startapp/sdk/internal/n0;->d:Lcom/startapp/sdk/internal/n0;", "return-object v0")),
    )),
    OwnedMethod("Lcom/startapp/sdk/common/advertisingid/b;", "a()Lcom/startapp/sdk/internal/n0;", 0x11, 10, 110, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Lcom/startapp/sdk/internal/n0;->d:Lcom/startapp/sdk/internal/n0;", "return-object v0")),
    )),
    OwnedMethod("Lcom/startapp/sdk/common/advertisingid/b;", "a(Z)V", 0x11, 4, 35, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lcom/startapp/sdk/internal/e2;", "a(Landroid/content/Context;Lcom/startapp/sdk/adsbase/model/AdPreferences;)V", 0x11, 5, 63, listOf(
        OwnedEdit(20, listOf(Opcode.SGET_OBJECT), listOf("Lcom/startapp/sdk/internal/gh;->b:Ljava/util/concurrent/atomic/AtomicBoolean;"), listOf("const/4 p2, 0x0", "iput-object p2, p0, Lcom/startapp/sdk/internal/e2;->k:Ljava/lang/String;", "nop"), target = 42, branch = 2),
    )),
    OwnedMethod("Lur6;", "run()V", 0x11, 11, 199, listOf(
        OwnedEdit(9, listOf(Opcode.INVOKE_STATIC), listOf("Lda;->a(Landroid/content/Context;)Lca;"), listOf("iput-object v0, p0, Lzr6;->m:Ljava/lang/String;", "nop"), target = 18, branch = 1),
    )),
    OwnedMethod("Lvs8;", "e(Landroid/webkit/WebView;Ljava/lang/String;Lq7;)Ljava/lang/Object;", 0x1, 7, 44, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "new-instance v1, Lpo6;", "invoke-direct {v1, v0}, Lpo6;-><init>(Ljava/lang/Throwable;)V", "return-object v1")),
    )),
    OwnedMethod("Lvs8;", "m(Ljava/lang/String;Lta1;)Ljava/lang/Object;", 0x1, 7, 37, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "new-instance v1, Lpo6;", "invoke-direct {v1, v0}, Lpo6;-><init>(Ljava/lang/Throwable;)V", "return-object v1")),
    )),
    OwnedMethod("Lo50;", "f(Lg60;I)V", 0x1, 47, 599, emptyList()),
)
