.class public final synthetic Ll/xza;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xza;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    iput-boolean p2, p0, Ll/xza;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xza;->a:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    iget-boolean p0, p0, Ll/xza;->b:Z

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->a5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;ZLjava/util/List;)V

    return-void
.end method
