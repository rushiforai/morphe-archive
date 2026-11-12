.class public final Llo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Llo0;

.field public static final c:Llo0;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Llo0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Llo0;-><init>(I)V

    sput-object v0, Llo0;->b:Llo0;

    new-instance v0, Llo0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Llo0;-><init>(I)V

    sput-object v0, Llo0;->c:Llo0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Llo0;->a:Z

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Llo0;->a:Z

    return p0
.end method
