.class public Ll/k0f0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k0f0;->z(Ll/k0f0$c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/k0f0;


# direct methods
.method public constructor <init>(Ll/k0f0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/k0f0$a;->b:Ll/k0f0;

    .line 2
    .line 3
    iput p2, p0, Ll/k0f0$a;->a:I

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
    iget-object v0, p0, Ll/k0f0$a;->b:Ll/k0f0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/k0f0;->y(Ll/k0f0;)Ll/k0f0$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Ll/k0f0$a;->a:I

    .line 8
    .line 9
    invoke-interface {v0, p1, p0}, Ll/k0f0$b;->a(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
