.class public final synthetic Ll/xv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aw90;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Ll/aw90;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xv90;->a:Ll/aw90;

    iput-object p2, p0, Ll/xv90;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/xv90;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/xv90;->d:Lcom/p1/mobile/putong/data/Media;

    iput-object p5, p0, Ll/xv90;->e:Lcom/p1/mobile/android/app/Act;

    iput p6, p0, Ll/xv90;->f:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xv90;->a:Ll/aw90;

    iget-object v1, p0, Ll/xv90;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/xv90;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/xv90;->d:Lcom/p1/mobile/putong/data/Media;

    iget-object v4, p0, Ll/xv90;->e:Lcom/p1/mobile/android/app/Act;

    iget v5, p0, Ll/xv90;->f:I

    invoke-static/range {v0 .. v5}, Ll/aw90;->m(Ll/aw90;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;I)V

    return-void
.end method
