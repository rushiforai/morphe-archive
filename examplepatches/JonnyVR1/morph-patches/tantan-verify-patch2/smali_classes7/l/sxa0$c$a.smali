.class public Ll/sxa0$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sxa0$c;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sxa0$c;


# direct methods
.method public constructor <init>(Ll/sxa0$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sxa0$c$a;->a:Ll/sxa0$c;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxa0$c$a;->a:Ll/sxa0$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sxa0$c;->b:Ll/x20;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
