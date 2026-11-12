.class public final Lvwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llrf;


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lvwk;->a:Z

    iput p2, p0, Lvwk;->b:I

    iput p3, p0, Lvwk;->c:I

    iput p4, p0, Lvwk;->d:I

    return-void
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lvwk;->c:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getDescription()I
    .registers 1

    iget p0, p0, Lvwk;->d:I

    return p0
.end method

.method public final getIcon()I
    .registers 1

    iget p0, p0, Lvwk;->b:I

    return p0
.end method

.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Lvwk;->a:Z

    return p0
.end method
