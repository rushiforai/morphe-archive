.class public Ll/z2j0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z2j0;->S()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/z2j0;


# direct methods
.method public constructor <init>(Ll/z2j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z2j0$a;->a:Ll/z2j0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z2j0$a;->a:Ll/z2j0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/z2j0;->M(Ll/z2j0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/z2j0$a;->a:Ll/z2j0;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/z2j0;->N(Ll/z2j0;Landroid/text/Editable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
