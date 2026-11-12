.class public final Lgd6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Z

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;B)V
    .registers 3

    packed-switch p2, :pswitch_data_12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgd6;->a:Landroid/content/Context;

    const/4 p1, -0x1

    iput p1, p0, Lgd6;->c:I

    return-void

    :pswitch_c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgd6;->a:Landroid/content/Context;

    return-void

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_c
    .end packed-switch
.end method
