.class public Lcom/leanplum/messagetemplates/options/CenterPopupOptions;
.super Lcom/leanplum/messagetemplates/options/BaseMessageOptions;
.source "SourceFile"


# instance fields
.field private height:I

.field private width:I


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;-><init>(Lcom/leanplum/ActionContext;)V

    const-string v0, "Layout.Width"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->setWidth(I)V

    const-string v0, "Layout.Height"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->setHeight(I)V

    return-void
.end method

.method private setHeight(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->height:I

    return-void
.end method

.method private setWidth(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->width:I

    return-void
.end method

.method public static toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 3

    invoke-static {p0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const/16 v0, 0x12c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "Layout.Width"

    invoke-virtual {p0, v1, v0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const/16 v0, 0xfa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "Layout.Height"

    invoke-virtual {p0, v1, v0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getHeight()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->height:I

    return p0
.end method

.method public getWidth()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->width:I

    return p0
.end method
