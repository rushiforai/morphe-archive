.class public final synthetic Ll/hvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;

.field public final synthetic b:Z

.field public final synthetic c:Ll/vg60;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLl/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iput-boolean p2, p0, Ll/hvf;->b:Z

    iput-object p3, p0, Ll/hvf;->c:Ll/vg60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iget-boolean v1, p0, Ll/hvf;->b:Z

    iget-object p0, p0, Ll/hvf;->c:Ll/vg60;

    check-cast p1, Lcom/p1/mobile/putong/data/FBPictures;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->a(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLl/vg60;Lcom/p1/mobile/putong/data/FBPictures;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
