.class public final synthetic Ll/pf40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pf40;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;

    iput p2, p0, Ll/pf40;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf40;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;

    iget p0, p0, Ll/pf40;->b:I

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;->j0(Lcom/p1/mobile/putong/core/newui/profile/newme/NewPrivilegeCard;ILcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method
