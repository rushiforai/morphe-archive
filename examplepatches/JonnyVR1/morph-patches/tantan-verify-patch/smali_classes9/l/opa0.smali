.class public final synthetic Ll/opa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ppa0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/IntlProfileInfo;


# direct methods
.method public synthetic constructor <init>(Ll/ppa0;Lcom/p1/mobile/putong/data/IntlProfileInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opa0;->a:Ll/ppa0;

    iput-object p2, p0, Ll/opa0;->b:Lcom/p1/mobile/putong/data/IntlProfileInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/opa0;->a:Ll/ppa0;

    iget-object p0, p0, Ll/opa0;->b:Lcom/p1/mobile/putong/data/IntlProfileInfo;

    invoke-static {v0, p0, p1}, Ll/ppa0;->E(Ll/ppa0;Lcom/p1/mobile/putong/data/IntlProfileInfo;Landroid/view/View;)V

    return-void
.end method
