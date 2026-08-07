.class public Ll/uqb0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gvl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uqb0;->H0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Ll/rg50;

.field public final synthetic b:Ll/uqb0;


# direct methods
.method public constructor <init>(Ll/uqb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uqb0$a;->b:Ll/uqb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/rg50;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uqb0$a;->a:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/uqb0$a;->a:Ll/rg50;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/uqb0$a;->a:Ll/rg50;

    .line 16
    .line 17
    return-object p0
.end method
