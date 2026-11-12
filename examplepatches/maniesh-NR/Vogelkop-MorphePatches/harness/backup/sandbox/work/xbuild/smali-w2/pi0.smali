.class public final Lpi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final a:Lpi0;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpi0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lpi0;->a:Lpi0;

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
