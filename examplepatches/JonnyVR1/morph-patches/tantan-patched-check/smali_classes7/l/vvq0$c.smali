.class public Ll/vvq0$c;
.super Ll/vvq0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vvq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private h:Ljava/lang/String;

.field protected i:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vvq0$a;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/vvq0$c;->h:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Ll/vvq0$c;->i:[Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vvq0$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/vvq0$c;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vvq0$c;->i:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, p1, v0, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method
