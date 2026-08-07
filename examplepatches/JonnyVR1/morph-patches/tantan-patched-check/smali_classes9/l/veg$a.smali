.class public Ll/veg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/veg;->I(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

.field public final synthetic b:Ll/veg;


# direct methods
.method public constructor <init>(Ll/veg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/veg$a;->b:Ll/veg;

    .line 2
    .line 3
    iput-object p2, p0, Ll/veg$a;->a:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/veg$a;->a:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getCannotJoinReason()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "applied"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->n3:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Ll/veg$a;->a:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getCannotJoinReason()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "memberReachLimit"

    .line 28
    .line 29
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->s3:I

    .line 36
    .line 37
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p0, Ll/veg$a;->b:Ll/veg;

    .line 42
    .line 43
    invoke-static {p1}, Ll/veg;->G(Ll/veg;)Ll/y8s;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Ll/cfg;

    .line 48
    .line 49
    iget-object p0, p0, Ll/veg$a;->a:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Ll/cfg;->X3(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
