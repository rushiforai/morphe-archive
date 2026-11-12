.class public final Lfsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhsn;


# static fields
.field public static final a:Lfsn;

.field public static final b:Lfsn;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lfsn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfsn;->a:Lfsn;

    new-instance v0, Lfsn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfsn;->b:Lfsn;

    return-void
.end method
