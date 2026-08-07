.class public Ll/mai0$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mai0$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mai0$b;


# direct methods
.method public constructor <init>(Ll/mai0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mai0$b$a;->a:Ll/mai0$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/mai0$b$a;->a:Ll/mai0$b;

    .line 2
    .line 3
    iget-object p1, p1, Ll/mai0$b;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/mai0$b$a;->a:Ll/mai0$b;

    .line 12
    .line 13
    iget-object p1, p0, Ll/mai0$b;->e:Ll/mai0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/mai0$b;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/wc00;->F(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
