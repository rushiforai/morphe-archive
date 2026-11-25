"""Independent original-source ad effect records."""
ADS_EDITS = [
    {'owner': 'Lpl6;', 'signature': 'h(Lkk6;Le34;)Llk6;', 'index': 312, 'original': ['invoke-virtual {v5, v7, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V'], 'replacement': ['nop']},
    {'owner': 'Lpl6;', 'signature': 'h(Lkk6;Le34;)Llk6;', 'index': 434, 'original': ['invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], 'replacement': ['nop']},
    {'owner': 'Ltd5;', 'signature': 'e(Ltd5;Lhp1;)Ljava/lang/Object;', 'index': 263, 'original': ['invoke-virtual {v3, v6, v10}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V'], 'replacement': ['nop']},
    {'owner': 'Ley1;', 'signature': 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'index': 513, 'original': ['invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], 'replacement': ['nop']},
    {'owner': 'Ld30;', 'signature': 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'index': 1131, 'original': ['invoke-virtual {v0, v7}, Li85;->add(Ljava/lang/Object;)Z'], 'replacement': ['nop']},
    {'owner': 'Ld30;', 'signature': 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'index': 1139, 'original': ['iget-boolean v3, v3, Lpi6;->d:Z'], 'replacement': ['const/4 v3, 0x0']},
    {'owner': 'Lxc0;', 'signature': 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'index': 35, 'original': ['iget-object p0, p0, Lxe4;->j:Ljava/lang/String;'], 'replacement': ['const/4 p0, 0x0']},
    {'owner': 'Lja;', 'signature': 'R0(Lja;Ly9;)V', 'index': 0, 'original': [], 'replacement': ['const/16 v0, 0x8', 'invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V', 'return-void']},
    {'owner': 'Lnl/omroepbrabant/android/app/App;', 'signature': 'onCreate()V', 'index': 56, 'original': ['invoke-static {v1}, Luh4;->X(Landroid/content/Context;)V'], 'replacement': ['nop']},
    {'owner': 'Lcom/startapp/sdk/adsbase/StartAppInitProvider;', 'signature': 'attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V', 'index': 1, 'original': ['invoke-static {p1}, Lcom/startapp/sdk/internal/xh;->c(Landroid/content/Context;)V'], 'replacement': ['nop']},
    {'owner': 'Lkj7;', 'signature': 'A0(Lfy2;Ljava/util/Map;)V', 'index': 727, 'original': ['new-instance v0, Ls96;', 'iget-object v6, p0, Lkj7;->a:Lrw2;', 'invoke-direct {v0, v6, p2, p1}, Ls96;-><init>(Lrw2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V', 'iput-object v0, p0, Lkj7;->i0:Ls96;', 'iget-object v6, p0, Lkj7;->o0:Lv8;', 'iput-object v6, v0, Ls96;->b:Lv8;'], 'replacement': ['nop', 'nop', 'nop', 'nop', 'nop', 'nop']},
    {'owner': 'Lkj7;', 'signature': 'A0(Lfy2;Ljava/util/Map;)V', 'index': 794, 'original': ['new-instance v0, Ls96;', 'iget-object v3, p0, Lkj7;->a:Lrw2;', 'invoke-direct {v0, v3, p2, p1}, Ls96;-><init>(Lrw2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V', 'iput-object v0, p0, Lkj7;->i0:Ls96;', 'iget-object p1, p0, Lkj7;->o0:Lv8;', 'iput-object p1, v0, Ls96;->b:Lv8;'], 'replacement': ['nop', 'nop', 'nop', 'nop', 'nop', 'nop']},
    {'owner': 'Lyh0;', 'signature': 'A0(Lfy2;Ljava/util/Map;)V', 'index': 1328, 'original': ['move-result v4'], 'replacement': ['const/4 v4, 0x0']},
    {'owner': 'Lyh0;', 'signature': 'A0(Lfy2;Ljava/util/Map;)V', 'index': 1344, 'original': ['move-result v4'], 'replacement': ['const/4 v4, 0x0']},
    {'owner': 'Lyh0;', 'signature': 't(Lhq;Ljava/util/Map;)V', 'index': 471, 'original': ['instance-of v6, v6, Ljava/util/List;'], 'replacement': ['const/4 v6, 0x0']},
    {'owner': 'Lyh0;', 'signature': 'g(Ljava/lang/String;Ljava/util/Map;)V', 'index': 11, 'original': ['iget-boolean v2, v0, Lyh0;->m1:Z'], 'replacement': ['const/4 v2, 0x0']},
    {'owner': 'Lcom/bluebillywig/bbnativeshared/model/EmbedObject;', 'signature': 'getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;', 'index': 0, 'original': ['iget-object p0, p0, Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adSchedulingData:Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;'], 'replacement': ['const/4 p0, 0x0']},
    {'owner': 'Lcom/bluebillywig/bbnativeshared/model/EmbedObject;', 'signature': 'getAdServicesData()Ljava/util/List;', 'index': 0, 'original': ['iget-object p0, p0, Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adServicesData:Ljava/util/List;'], 'replacement': ['const/4 p0, 0x0']},
    {'owner': 'Lnl/pinch/optoutadvertising/sdk/ui/OptOutAdView;', 'signature': 'e(Lk9;)V', 'index': 2, 'original': [], 'replacement': ['new-instance v0, Ljava/lang/IllegalStateException;', 'const-string v1, "Advertising disabled"', 'invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V', 'invoke-interface {p1, v0}, Lk9;->onFailure(Ljava/lang/Throwable;)V', 'return-void']},
    {'owner': 'Lew9;', 'signature': 'a(Ld66;Lty;Lb45;Lao3;Lgq3;I)V', 'index': 0, 'original': [], 'replacement': ['return-void']},
    {'owner': 'Lpl6;', 'signature': 'h(Lkk6;Le34;)Llk6;', 'index': 145, 'original': ['move-result-object v7'], 'replacement': ['const/4 v7, 0x0']},
    {'owner': 'Lpl6;', 'signature': 'h(Lkk6;Le34;)Llk6;', 'index': 366, 'original': ['move-result-object v33'], 'replacement': ['const/16 v33, 0x0']},
]

ADS_COMPONENTS = [
    ("service", "com.startapp.sdk.cachedservice.BackgroundService"),
    ("service", "com.startapp.sdk.jobs.SchedulerService"),
    ("receiver", "com.startapp.sdk.adsbase.remoteconfig.BootCompleteListener"),
]
