.class public final Lij0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lij0;

.field public static final c:Lij0;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lij0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lij0;-><init>(I)V

    sput-object v0, Lij0;->b:Lij0;

    new-instance v0, Lij0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lij0;-><init>(I)V

    sput-object v0, Lij0;->c:Lij0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lij0;->a:Z

    return-void
.end method

.method public static final a(I)Lij0;
    .registers 2

    if-eqz p0, :cond_d

    const/4 v0, 0x1

    if-ne p0, v0, :cond_8

    sget-object p0, Lij0;->c:Lij0;

    return-object p0

    :cond_8
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_d
    sget-object p0, Lij0;->b:Lij0;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Lij0;->a:Z

    return p0
.end method
