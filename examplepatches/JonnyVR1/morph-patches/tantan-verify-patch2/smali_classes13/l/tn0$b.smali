.class Ll/tn0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fb1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tn0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ll/tn0;


# direct methods
.method private constructor <init>(Ll/tn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tn0$b;->a:Ll/tn0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/tn0;Ll/tn0$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/tn0$b;-><init>(Ll/tn0;)V

    return-void
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tn0$b;->a:Ll/tn0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tn0;->a:Ll/dpl$a;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p1
.end method
