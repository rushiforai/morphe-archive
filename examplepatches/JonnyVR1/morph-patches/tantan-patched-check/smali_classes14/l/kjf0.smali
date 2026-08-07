.class public final synthetic Ll/kjf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ujf0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/ujf0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kjf0;->a:Ll/ujf0;

    iput-object p2, p0, Ll/kjf0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kjf0;->a:Ll/ujf0;

    iget-object p0, p0, Ll/kjf0;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Ll/ujf0;->X0(Ll/ujf0;Ljava/lang/Runnable;)V

    return-void
.end method
