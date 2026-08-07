.class public final synthetic Ll/ba40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/NewPictureView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ba40;->a:Lcom/p1/mobile/putong/core/newui/NewPictureView;

    iput-object p2, p0, Ll/ba40;->b:Ljava/lang/String;

    iput p3, p0, Ll/ba40;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ba40;->a:Lcom/p1/mobile/putong/core/newui/NewPictureView;

    iget-object v1, p0, Ll/ba40;->b:Ljava/lang/String;

    iget p0, p0, Ll/ba40;->c:I

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->f(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method
