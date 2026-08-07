.class public Ll/rwj0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rwj0;->l(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/rwj0;


# direct methods
.method public constructor <init>(Ll/rwj0;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rwj0$b;->b:Ll/rwj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rwj0$b;->a:Ljava/lang/String;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/rwj0$b;->b:Ll/rwj0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/puj0;->c:Ll/ouj0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll/qwj0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/rwj0$b;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/qwj0;->R3(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
