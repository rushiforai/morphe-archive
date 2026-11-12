.class public final Lswk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:J

.field public static final d:J

.field public static final synthetic e:I


# instance fields
.field public final a:Lb59;

.field public final b:Lumi;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x1

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Lswk;->c:J

    const/16 v0, 0x48

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Lswk;->d:J

    return-void
.end method

.method public constructor <init>(Lb59;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lswk;->a:Lb59;

    iput-object p2, p0, Lswk;->b:Lumi;

    return-void
.end method


# virtual methods
.method public final a()Landroid/content/SharedPreferences;
    .registers 1

    iget-object p0, p0, Lswk;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    return-object p0
.end method
