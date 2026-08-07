.class public final synthetic Ll/d2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/LinkIntent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d2f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iput-object p2, p0, Ll/d2f0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/d2f0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/d2f0;->d:Lcom/p1/mobile/putong/data/LinkIntent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d2f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iget-object v1, p0, Ll/d2f0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/d2f0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/d2f0;->d:Lcom/p1/mobile/putong/data/LinkIntent;

    check-cast p1, Ll/q1e;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->w(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    move-result-object p0

    return-object p0
.end method
