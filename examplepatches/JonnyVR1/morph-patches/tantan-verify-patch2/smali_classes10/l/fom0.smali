.class public Ll/fom0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/view/View;

.field public final c:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fom0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fom0;->b:Landroid/view/View;

    .line 7
    .line 8
    iput p3, p0, Ll/fom0;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fom0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fom0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fom0;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method
