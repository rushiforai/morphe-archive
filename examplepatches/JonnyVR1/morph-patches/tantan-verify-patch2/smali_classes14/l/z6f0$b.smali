.class public Ll/z6f0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z6f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/z6f0;


# direct methods
.method public constructor <init>(Ll/z6f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z6f0$b;->a:Ll/z6f0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z6f0$b;->a:Ll/z6f0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/z6f0;->g:Lv/VCheckBox;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/z6f0$b;->a:Ll/z6f0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/z6f0;->z()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/z6f0$b;->a:Ll/z6f0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/z6f0;->n(Ll/z6f0;)Ll/u6f0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/u6f0;->B1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
