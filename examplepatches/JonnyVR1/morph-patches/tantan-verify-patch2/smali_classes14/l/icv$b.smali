.class public Ll/icv$b;
.super Ll/jri0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/icv;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ll/icv;


# direct methods
.method public constructor <init>(Ll/icv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/icv$b;->this$0:Ll/icv;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jri0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/icv$b;->this$0:Ll/icv;

    .line 14
    .line 15
    invoke-static {p1}, Ll/icv;->i(Ll/icv;)Ll/r0u;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/icv$b;->this$0:Ll/icv;

    .line 22
    .line 23
    invoke-static {p0}, Ll/icv;->i(Ll/icv;)Ll/r0u;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
