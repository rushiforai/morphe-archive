.class public final Ll/txx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Float;

.field public final b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jxx0;Ll/oxx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jxx0;->d(Ll/jxx0;)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/txx0;->a:Ljava/lang/Float;

    .line 9
    .line 10
    invoke-static {p1}, Ll/jxx0;->e(Ll/jxx0;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/txx0;->b:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Float;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x1
    .end annotation

    .line 1
    iget-object p0, p0, Ll/txx0;->a:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Ll/wqr0;
        zza = 0x2
    .end annotation

    .line 1
    iget-object p0, p0, Ll/txx0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
