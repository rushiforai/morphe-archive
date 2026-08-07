.class public final synthetic Ll/sb1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wb1;

.field public final synthetic b:Ll/wtl;


# direct methods
.method public synthetic constructor <init>(Ll/wb1;Ll/wtl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sb1;->a:Ll/wb1;

    iput-object p2, p0, Ll/sb1;->b:Ll/wtl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sb1;->a:Ll/wb1;

    iget-object p0, p0, Ll/sb1;->b:Ll/wtl;

    invoke-static {v0, p0}, Ll/wb1;->a(Ll/wb1;Ll/wtl;)V

    return-void
.end method
