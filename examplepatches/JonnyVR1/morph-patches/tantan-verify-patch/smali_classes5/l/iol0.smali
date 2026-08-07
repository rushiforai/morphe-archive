.class public final synthetic Ll/iol0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iol0;->a:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    iput p2, p0, Ll/iol0;->b:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iol0;->a:Lcom/p1/mobile/putong/core/ui/result/VipContent$a;

    iget p0, p0, Ll/iol0;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContent$a;->F(Lcom/p1/mobile/putong/core/ui/result/VipContent$a;ILcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
