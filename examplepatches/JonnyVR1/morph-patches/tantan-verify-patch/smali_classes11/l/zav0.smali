.class public final synthetic Ll/zav0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# instance fields
.field public final synthetic a:Ll/fbv0;

.field public final synthetic b:Ll/hbv0;


# direct methods
.method public synthetic constructor <init>(Ll/fbv0;Ll/hbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zav0;->a:Ll/fbv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zav0;->b:Ll/hbv0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zav0;->a:Ll/fbv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zav0;->b:Ll/hbv0;

    .line 4
    .line 5
    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/fbv0;->b(Ll/hbv0;Landroid/database/sqlite/SQLiteDatabase;)Ljava/lang/Void;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method
