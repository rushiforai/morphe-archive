.class public Lcom/p1/mobile/android/app/Act$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/ArrayAdapter;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/ArrayAdapter;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$l;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$l;->a:Landroid/widget/ArrayAdapter;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/android/app/Act$l;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/text/Editable;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act$l;->a:Landroid/widget/ArrayAdapter;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$l;->a:Landroid/widget/ArrayAdapter;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$l;->b:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$l;->a:Landroid/widget/ArrayAdapter;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$l;->b:Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ll/m20;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/m20;-><init>(Landroid/text/Editable;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
