.class public final synthetic Lwv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/widget/UrlFieldEditText;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;B)V
    .registers 3

    iput-byte p2, p0, Lwv7;->a:B

    iput-object p1, p0, Lwv7;->b:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lwv7;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lwv7;->b:Lcom/opera/android/widget/UrlFieldEditText;

    packed-switch v0, :pswitch_data_14

    sget v0, Lcom/opera/android/widget/UrlFieldEditText;->i0:I

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->D()V

    return-void

    :pswitch_e
    iput-boolean v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->y:Z

    return-void

    :pswitch_11
    iput-boolean v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->y:Z

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_11
        :pswitch_e
    .end packed-switch
.end method
