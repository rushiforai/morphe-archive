.class public final Lvl8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lvl8;


# instance fields
.field public final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lvl8;

    invoke-direct {v0}, Lvl8;-><init>()V

    sput-object v0, Lvl8;->b:Lvl8;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lvl8;->a:Ljava/util/HashMap;

    return-void
.end method
