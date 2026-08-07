.class public final synthetic Ll/wmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/moregender/IntlMoreGenderItemView;

.field public final synthetic b:Ll/xmo;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/data/IntlGenderItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/moregender/IntlMoreGenderItemView;Ll/xmo;ILcom/p1/mobile/putong/data/IntlGenderItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wmo;->a:Lcom/p1/mobile/putong/account/ui/moregender/IntlMoreGenderItemView;

    iput-object p2, p0, Ll/wmo;->b:Ll/xmo;

    iput p3, p0, Ll/wmo;->c:I

    iput-object p4, p0, Ll/wmo;->d:Lcom/p1/mobile/putong/data/IntlGenderItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wmo;->a:Lcom/p1/mobile/putong/account/ui/moregender/IntlMoreGenderItemView;

    iget-object v1, p0, Ll/wmo;->b:Ll/xmo;

    iget v2, p0, Ll/wmo;->c:I

    iget-object p0, p0, Ll/wmo;->d:Lcom/p1/mobile/putong/data/IntlGenderItem;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xmo;->E(Lcom/p1/mobile/putong/account/ui/moregender/IntlMoreGenderItemView;Ll/xmo;ILcom/p1/mobile/putong/data/IntlGenderItem;Landroid/view/View;)V

    return-void
.end method
