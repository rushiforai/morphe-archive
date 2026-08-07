.class public final synthetic Ll/abv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# instance fields
.field public final synthetic a:Ll/fbv0;

.field public final synthetic b:Ll/hct0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/fbv0;Ll/hct0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/abv0;->a:Ll/fbv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/abv0;->b:Ll/hct0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/abv0;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/abv0;->a:Ll/fbv0;

    .line 2
    .line 3
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    iget-object v1, p0, Ll/abv0;->b:Ll/hct0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/abv0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Ll/fbv0;->j(Landroid/database/sqlite/SQLiteDatabase;Ll/hct0;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
