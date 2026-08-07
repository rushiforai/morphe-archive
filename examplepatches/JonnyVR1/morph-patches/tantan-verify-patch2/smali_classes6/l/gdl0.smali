.class public final synthetic Ll/gdl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gdl0;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    iput p2, p0, Ll/gdl0;->b:I

    iput p3, p0, Ll/gdl0;->c:I

    iput-object p4, p0, Ll/gdl0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gdl0;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    iget v1, p0, Ll/gdl0;->b:I

    iget v2, p0, Ll/gdl0;->c:I

    iget-object p0, p0, Ll/gdl0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;IILjava/lang/String;)V

    return-void
.end method
