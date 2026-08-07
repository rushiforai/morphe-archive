.class public final synthetic Ll/cbv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/database/sqlite/SQLiteDatabase;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/hct0;


# direct methods
.method public synthetic constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ll/hct0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cbv0;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cbv0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/cbv0;->c:Ll/hct0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cbv0;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cbv0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cbv0;->c:Ll/hct0;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/fbv0;->i(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ll/hct0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
