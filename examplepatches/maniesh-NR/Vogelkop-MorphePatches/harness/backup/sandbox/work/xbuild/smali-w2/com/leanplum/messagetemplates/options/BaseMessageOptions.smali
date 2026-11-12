.class public abstract Lcom/leanplum/messagetemplates/options/BaseMessageOptions;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private acceptButtonBackgroundColor:I

.field private acceptButtonText:Ljava/lang/String;

.field private acceptButtonTextColor:I

.field private backgroundColor:I

.field private backgroundImage:Landroid/graphics/Bitmap;

.field private context:Lcom/leanplum/ActionContext;

.field private messageColor:I

.field private messageText:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private titleColor:I


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->context:Lcom/leanplum/ActionContext;

    const-string v0, "Title.Text"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setTitle(Ljava/lang/String;)V

    const-string v0, "Title.Color"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setTitleColor(I)V

    const-string v0, "Message.Text"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setMessageText(Ljava/lang/String;)V

    const-string v0, "Message.Color"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setMessageColor(I)V

    const-string v0, "Background image"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->streamNamed(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_40

    :try_start_39
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setBackgroundImage(Landroid/graphics/Bitmap;)V
    :try_end_40
    .catchall {:try_start_39 .. :try_end_40} :catchall_40

    :catchall_40
    :cond_40
    const-string v0, "Background color"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setBackgroundColor(I)V

    const-string v0, "Accept button.Text"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setAcceptButtonText(Ljava/lang/String;)V

    const-string v0, "Accept button.Background color"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setAcceptButtonBackgroundColor(I)V

    const-string v0, "Accept button.Text color"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->numberNamed(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->setAcceptButtonTextColor(I)V

    return-void
.end method

.method private setAcceptButtonBackgroundColor(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonBackgroundColor:I

    return-void
.end method

.method private setAcceptButtonText(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonText:Ljava/lang/String;

    return-void
.end method

.method private setAcceptButtonTextColor(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonTextColor:I

    return-void
.end method

.method private setBackgroundColor(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->backgroundColor:I

    return-void
.end method

.method private setBackgroundImage(Landroid/graphics/Bitmap;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->backgroundImage:Landroid/graphics/Bitmap;

    return-void
.end method

.method private setMessageColor(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->messageColor:I

    return-void
.end method

.method private setMessageText(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->messageText:Ljava/lang/String;

    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->title:Ljava/lang/String;

    return-void
.end method

.method private setTitleColor(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->titleColor:I

    return-void
.end method

.method public static toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 5

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v1, "Title.Text"

    invoke-static {p0}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Title.Color"

    const/high16 v1, -0x1000000

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Message.Text"

    const-string v2, "Popup message goes here."

    invoke-virtual {p0, v0, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Message.Color"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Background image"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Background color"

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2}, Lcom/leanplum/ActionArgs;->withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept button.Text"

    const-string v3, "OK"

    invoke-virtual {p0, v0, v3}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept button.Background color"

    invoke-virtual {p0, v0, v2}, Lcom/leanplum/ActionArgs;->withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept button.Text color"

    const v2, -0xff8501

    invoke-virtual {p0, v0, v2}, Lcom/leanplum/ActionArgs;->withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept action"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public accept()V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->context:Lcom/leanplum/ActionContext;

    const-string v0, "Accept action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method public dismiss()V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->context:Lcom/leanplum/ActionContext;

    const-string v0, "Dismiss action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method public getAcceptButtonBackgroundColor()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonBackgroundColor:I

    return p0
.end method

.method public getAcceptButtonText()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonText:Ljava/lang/String;

    return-object p0
.end method

.method public getAcceptButtonTextColor()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->acceptButtonTextColor:I

    return p0
.end method

.method public getBackgroundColor()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->backgroundColor:I

    return p0
.end method

.method public getBackgroundImage()Landroid/graphics/Bitmap;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->backgroundImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public getBackgroundImageRounded(I)Landroid/graphics/Bitmap;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->backgroundImage:Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Lcom/leanplum/utils/BitmapUtil;->getRoundedCornerBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public getMessageColor()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->messageColor:I

    return p0
.end method

.method public getMessageText()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->messageText:Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->title:Ljava/lang/String;

    return-object p0
.end method

.method public getTitleColor()I
    .registers 1

    iget p0, p0, Lcom/leanplum/messagetemplates/options/BaseMessageOptions;->titleColor:I

    return p0
.end method
