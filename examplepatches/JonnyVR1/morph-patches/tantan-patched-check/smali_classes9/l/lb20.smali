.class public final synthetic Ll/lb20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lb20;->a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

    iput-object p2, p0, Ll/lb20;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lb20;->a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

    iget-object p0, p0, Ll/lb20;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V

    return-void
.end method
