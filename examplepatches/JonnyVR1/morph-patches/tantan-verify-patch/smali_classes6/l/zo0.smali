.class public final synthetic Ll/zo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ap0;

.field public final synthetic b:Ll/wtl;


# direct methods
.method public synthetic constructor <init>(Ll/ap0;Ll/wtl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zo0;->a:Ll/ap0;

    iput-object p2, p0, Ll/zo0;->b:Ll/wtl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zo0;->a:Ll/ap0;

    iget-object p0, p0, Ll/zo0;->b:Ll/wtl;

    invoke-static {v0, p0}, Ll/ap0;->a(Ll/ap0;Ll/wtl;)V

    return-void
.end method
