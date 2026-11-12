.class public interface abstract Lssh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lrsh;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lrsh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lssh;->a:Lrsh;

    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b()V
.end method
