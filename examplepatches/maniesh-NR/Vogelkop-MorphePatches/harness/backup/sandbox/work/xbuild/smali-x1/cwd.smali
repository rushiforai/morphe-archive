.class public final Lcwd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llrf;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(IILjava/lang/Runnable;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcwd;->a:I

    iput p2, p0, Lcwd;->b:I

    iput-object p3, p0, Lcwd;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lcwd;->a:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getDescription()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getIcon()I
    .registers 1

    iget p0, p0, Lcwd;->b:I

    return p0
.end method

.method public final getValue()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
