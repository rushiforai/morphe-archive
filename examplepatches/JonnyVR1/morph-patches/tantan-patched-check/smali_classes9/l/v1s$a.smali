.class public Ll/v1s$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v1s;->Q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/v1s;


# direct methods
.method public constructor <init>(Ll/v1s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v1s$a;->a:Ll/v1s;

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
    iget-object v0, p0, Ll/v1s$a;->a:Ll/v1s;

    .line 2
    .line 3
    invoke-static {v0}, Ll/v1s;->L(Ll/v1s;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/v1s$a;->a:Ll/v1s;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/v1s;->M(Ll/v1s;Landroid/text/Editable;)V

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
