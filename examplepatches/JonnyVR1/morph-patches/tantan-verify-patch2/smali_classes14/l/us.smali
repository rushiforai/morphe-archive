.class public final synthetic Ll/us;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ws;

.field public final synthetic b:Landroid/database/Cursor;


# direct methods
.method public synthetic constructor <init>(Ll/ws;Landroid/database/Cursor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/us;->a:Ll/ws;

    iput-object p2, p0, Ll/us;->b:Landroid/database/Cursor;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/us;->a:Ll/ws;

    iget-object p0, p0, Ll/us;->b:Landroid/database/Cursor;

    invoke-static {v0, p0}, Ll/ws;->d(Ll/ws;Landroid/database/Cursor;)V

    return-void
.end method
