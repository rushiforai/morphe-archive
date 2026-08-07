.class public final synthetic Ll/phe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/md20$c;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/phe0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/phe0;->b:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final a(Ll/md20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phe0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/phe0;->b:Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/qhe0$a;->a(Ljava/lang/String;Ll/gcg0;Ll/md20;)V

    return-void
.end method
