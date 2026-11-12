.class public final Lb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lb60;

.field public static final c:Lb60;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lb60;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lb60;-><init>(I)V

    sput-object v0, Lb60;->b:Lb60;

    new-instance v0, Lb60;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lb60;-><init>(I)V

    sput-object v0, Lb60;->c:Lb60;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lb60;->a:Z

    return-void
.end method

.method public static final a(I)Lb60;
    .registers 2

    if-eqz p0, :cond_d

    const/4 v0, 0x1

    if-ne p0, v0, :cond_8

    sget-object p0, Lb60;->c:Lb60;

    return-object p0

    :cond_8
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_d
    sget-object p0, Lb60;->b:Lb60;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Lb60;->a:Z

    return p0
.end method
