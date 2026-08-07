.class public final synthetic Ll/oza;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oza;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    iput-object p2, p0, Ll/oza;->b:Ljava/util/List;

    iput-object p3, p0, Ll/oza;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oza;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    iget-object v1, p0, Ll/oza;->b:Ljava/util/List;

    iget-object p0, p0, Ll/oza;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Z4(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Ljava/util/List;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
