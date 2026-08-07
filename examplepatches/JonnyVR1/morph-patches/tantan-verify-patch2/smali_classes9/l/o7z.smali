.class public final synthetic Ll/o7z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7z;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/o7z;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o7z;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/o7z;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/nbz;->x(Ljava/lang/String;Ll/y20;)V

    return-void
.end method
