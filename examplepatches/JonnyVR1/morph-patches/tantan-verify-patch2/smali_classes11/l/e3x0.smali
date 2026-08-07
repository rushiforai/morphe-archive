.class public final synthetic Ll/e3x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t7x0;


# static fields
.field public static final synthetic a:Ll/e3x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/e3x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e3x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/e3x0;->a:Ll/e3x0;

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
.method public final zza()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance p0, Ll/ozw0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Ll/ozw0;-><init>(Ll/nzw0;)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ozw0;->a(I)Ll/ozw0;

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x20

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/ozw0;->b(I)Ll/ozw0;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ozw0;->c(I)Ll/ozw0;

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/pzw0;->b:Ll/pzw0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ozw0;->d(Ll/pzw0;)Ll/ozw0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ozw0;->e()Ll/rzw0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
