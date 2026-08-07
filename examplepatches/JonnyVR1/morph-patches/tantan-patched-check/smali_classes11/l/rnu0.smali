.class public final synthetic Ll/rnu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# static fields
.field public static final synthetic a:Ll/rnu0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/rnu0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rnu0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/rnu0;->a:Ll/rnu0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    const-string p0, "Show native ad policy validator overlay."

    .line 4
    .line 5
    invoke-static {p0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/wit0;->zzF()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
